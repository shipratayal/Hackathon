package com

class Store {

    String name
    String address1
    String address2
    String city
    String state
    String owner

    static hasMany = [authors:Author,books:Book,categories:Category,publications:Publication,subCategory:SubCategory]

    static constraints = {
        name(nullable: false,blank: false)
        address1(nullable: false,blank: false)
        address2(nullable: true,blank: true)
        city(nullable: false,blank: false)
        state(nullable: false,blank: false)
        owner(nullable: false,blank: false)
    }
    public String getTheAddress(){
        return this.address1+" "+this.address2
    }
}
