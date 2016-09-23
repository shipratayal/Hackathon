import com.Author
import com.Book
import com.Category
import com.Publication
import com.Review
import com.SubCategory
import com.bookstore.Role
import com.bookstore.User
import com.bookstore.UserRole

class BootStrap {

    def init = { servletContext ->
        if(!Role.count()){
            new Role(authority: 'ROLE_ADMIN').save(flush: true)
            new Role(authority: 'ROLE_USER').save(flush: true)
        }
        if(!User.count()){
            def adminUser = new User(username: 'admin', enabled: true, password: 'admin').save(flush: true)
            def testUser = new User(username: 'vijay', enabled: true, password: 'shukla').save(flush: true)

            UserRole.create adminUser, Role.findByAuthority('ROLE_ADMIN'), true
            UserRole.create testUser, Role.findByAuthority('ROLE_USER'), true
        }

        if(!Author.count()){
            new Author(name: "Vijay Shukla").save(flush: true)
        }
        if(!Category.count()){
            new Category(name: "Book Test Category").save(flush: true)
        }
        if (!SubCategory.count()){
            def subCategory= new SubCategory(name: "Book Test Sub Category")
            def category=Category.findByName("Book Test Category")
            subCategory.category=category
            subCategory.save(flush: true)
            category.addToSubCategories(subCategory)
            category.save(flush: true)
        }
        if(!Publication.count()){
            def publication=new Publication(name: "Nexthoughts",startDate: new Date())
            publication.save(flush: true)
        }
        if(!Book.count){
            def book=new Book()
            def author=Author.findByName("Vijay Shukla")
            def subCategory=SubCategory.findByName("Book Test Sub Category")
            def publication=Publication.findByName("Nexthoughts")

            book.price=50.04
            book.title="The Book Store Testing"
            book.ISBN="1234-5678-9123-4567"
            book.description="jbasjbhdcjhasbdjcb"
            book.publication=publication
            book.subCategory=subCategory
            book.releasedDate=new Date()

            book.addToAuthors(author)
            book.save(flush: true)
            publication.addToBooks(book)
            author.addToBooks(book)
            subCategory.addToBooks(book)

            author.save(flush: true)
            subCategory.save(flush: true)
            publication.save(flush: true)
        }
        if (!Review.count()){
            def review=new Review(message: "Checking Review",user:User.findByUsername('vijay'))
            review.save(flush: true)

            def book=Book.findByTitle("The Book Store Testing")
            book.addToReviews(review)
            book.save(flush: true)
        }
    }
    def destroy = {
    }
}
