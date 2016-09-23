package com.book

import com.Author
import com.Book
import com.Store
import com.admin.BookCO
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class BookController {
    def adminService

    def allBook(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        List<Book> bookList = Book.createCriteria().list(max: params.max, offset: params.offset) {

        }
        render(view: "allBook", model: [bookList: bookList, bookTotal: bookList.totalCount, max: params.max])
    }

    def addBook() {
        BookCO bookCO = new BookCO()
        render(view: "addBook", model: [bookCO: bookCO])
    }

    def saveBook() {
        println("Save Book")
        BookCO bookCO = new BookCO()
        bookCO.populateDataFromParams(params)
        if (!bookCO.validate()) {
            render(view: "addBook", model: [bookCO: bookCO])
            return
        }
        Book book = bookCO.populateDataFromBookCO()
        def authors = Author.getAll(params.list('authors'))
        println("/////////${authors*.name}////////////")
        authors.each {
            book.addToAuthors(it)
        }
        book.save(flush: true)
        println("////////////")
        authors.each {
            it.addToBooks(book)
            it.save(flush: true)
        }
        redirect(action: 'allBook')
    }

    def deleteBook() {
        def data=[:]
        def id = params.id as Long
        def book = Book.findById(id)
        println("My Book id is "+book.id)
        Boolean flag=adminService.deleteBook(book)
        if(flag){
            data.success="success"
            println("Success")
        }
        else {
            println("Failed")
            data.error="failed"
        }
        render data as JSON
    }

    def updateBook() {
        def id = params.id as Long
        def book = Book.findById(id)
        println("My Book is  " + book)
    }

    def showBook(Long id) {
        println("Find Book")
        Book book = Book.findById(id)
//        println(book)
        def bookAuthors = book.authors
        def authors = Author.list()
        def authorList = []
        authors.each { author ->
            if (!(author in bookAuthors))
                authorList << author
        }
        render(view: 'showBook', model: [book: book, authorList: authorList])
    }
}
