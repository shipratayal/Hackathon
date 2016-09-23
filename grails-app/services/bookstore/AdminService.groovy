package bookstore

import com.Book
import com.Publication
import com.Review
import com.Store
import grails.transaction.Transactional

@Transactional
class AdminService {

    Boolean deleteBook(def book) {
        println("My Book in delete is  " + book)
        def publication = book.publication
        def subCategory = book.subCategory

        println("Publication " + publication + " SubCategory " + subCategory)
        publication.removeFromBooks(book)
        subCategory.removeFromBooks(book)

        def authors = book.authors
        authors.each {
            book.removeFromAuthors(it)
            println("Author of the Book is " + it.name)
        }
        def reviews = Review.findAllByBook(book)
        reviews.removeAll()
        println("Now Book has been removed")
        book.delete(flush: true)
        return true
    }

    Boolean deletePublication(def publication) {
        def books = publication.books
        def books1 = Book.findAllByPublication(publication)

        if (books1) {
            return false
        } else {
            books.each {
                publication.removeFromBooks(it)
            }
        }
        println("Now Publication has been removed")
        publication.delete(flush: true)
        return true
    }

    Boolean deleteStore(def store) {
        println("Now Store has been removed")
//        boolean status=false
        store.delete(flush: true)
        return true
    }

    Boolean deleteAuthor(def author) {
        println("Inside the delete")
        boolean status = false
        def books = author.books
        books.each {book->
            println("no of authors "+book.authors.size())
            if (!(book.authors.size() > 1)) {
                status = true
                println("Have only one author")
                return false
            }
        }
        println("Status "+status)
        if (status) {
            return false
        }
        else{
            int i=0
            def bookList=[]
            bookList+=books
            bookList.each{ book->
                println("i=${++i}")
                author.removeFromBooks(book)
//                book.delete()
            }
            author.delete(flush: true)
            return true
        }
    }

    Boolean deleteSubCategory(def subCategory) {
        def books = Book.findAllBySubCategory(subCategory)
//        books.each { book ->
//            deleteBook(book)
//        }
        if(books){
            return false
        }else {
            books.each {
                subCategory.removeFromBooks(it)
            }
        }
        println("Now Sub Category has been removed")
        subCategory.delete()
        return true
    }

    Boolean deleteCategory(def category) {
        def subCategories = category.subCategories
        if(subCategories){
            return false
        }
        else {
            subCategories.each {
                category.removeFromSubCategories(it)
            }
        }
        println("Now Category has been removed")
        category.delete(flush: true)
        return true
    }
}
