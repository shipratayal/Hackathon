package com.book

import com.Author
import com.Book
import com.Publication
import com.admin.AuthorCO
import com.admin.BookCO
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class AuthorController {
    def adminService

    def allAuthor(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        List<Author> authorList = Author.createCriteria().list(max: params.max, offset: params.offset) {

        }
        render(view: "allAuthor", model: [authorList: authorList, authorTotal: authorList.totalCount, max: params.max])
    }

    def addAuthor() {
        AuthorCO authorCO = new AuthorCO()
        render(view: "addAuthor", model: [authorCO: authorCO])
    }

    def saveAuthor() {
        println("Save Author")
        AuthorCO authorCO = new AuthorCO()
        authorCO.populateDataFromParams(params)
        if (!authorCO.validate()) {
            render(view: "addAuthor", model: [authorCO: authorCO])
            return
        }
        Author author = authorCO.populateDataFromAuthorCO()
        println("????????????????/*/**/*/"+params.list('books'))
        def books = Book.getAll(params.list('books'))
        println(books*.id)
        author.books = books
        author.save(flush: true)
        redirect(action: 'allAuthor')
    }

    def deleteAuthor() {
        println("/////")
        def data=[:]
        def id = params.id as Long
        println("My data is "+id)
        def author = Author.findById(id)
        Boolean flag=adminService.deleteAuthor(author)
        if(flag){
            data.success="success"
        }
        else {
            println("Failed")
            data.failed="failed"
        }
        render data as JSON
    }

    def updateAuthor() {

    }

    def showAuthor(Long id) {
        println("Find Author")
        Author author = Author.findById(id)
        println(author)
        def authorBooks = author.books
        def books = Book.list()
        def bookList = []
        books.each { book ->
            if (!(book in authorBooks))
                bookList << book
        }

        render(view: 'showAuthor', model: [author: author, bookList: bookList])
    }
}
