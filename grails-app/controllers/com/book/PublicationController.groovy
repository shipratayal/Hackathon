package com.book

import com.Author
import com.Book
import com.Publication
import com.admin.PublicationCO
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class PublicationController {

    def adminService

    def allPublication(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        List<Publication> listOfPublications = Publication.createCriteria().list(max: params.max, offset: params.offset) {

        }
        render(view: "/publication/allPublication", model: [listOfPublications: listOfPublications, publicationTotal: listOfPublications.totalCount, max: params.max])
    }

    def addPublication() {
        PublicationCO publicationCO = new PublicationCO()
        render(view: 'addPublication', model: [publicationCO: publicationCO])
    }

    def savePublication() {
        println("Save Publication")
        PublicationCO publicationCO = new PublicationCO()
        println(params)
        publicationCO.populateDataFromParams(params)
        if (!publicationCO.validate()) {
            render(view: 'addPublication', model: [publicationCO: publicationCO])
            return
        }
        Publication publication = publicationCO.populateDataFromPublicationCO()
        def books = Book.getAll(params.list('books'))
        books.each {
            publication.addToBooks(it)
        }
        publication.save(flush: true)
        books.each {
            it.publication = publication
            it.save(flush: true)
        }
        redirect(action: 'allPublication')
    }

    def showPublication(Long id) {
        Publication publication = Publication.findById(id)
        def publicationBooks = publication.books
        def books = Book.list()
        def bookList = []
        books.each { book ->
            if (!(book in publicationBooks))
                bookList << book
        }
        render(view: 'showPublication', model: [publication: publication, bookList: bookList])
    }

    def deletePublication() {
        println("/////")
        def data=[:]
        def id = params.id as Long
        def publication = Publication.findById(id)
        println("My Publication id is " + id)
        Boolean flag = adminService.deletePublication(publication)
        if (flag) {
            data.success = "success"
        } else {
            println("Failed")
            data.failed = "failed"
        }
        render data as JSON
    }

    def updatePublication() {

    }
}
