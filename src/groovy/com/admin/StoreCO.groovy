package com.admin

import com.Store
import grails.validation.Validateable

@Validateable
class StoreCO {
    String name
    String address1
    String address2
    String city
    String state
    String owner

    static constraints = {
        name(nullable: false,blank: false)
        address1(nullable: false,blank: false)
        address2(nullable: true,blank: true)
        city(nullable: false,blank: false)
        state(nullable: false,blank: false)
        owner(nullable: false,blank: false)
    }

    def populateDataFromParams(def params){
        println(params)
        this.name=params.storeName
        this.owner=params.storeOwner
        this.city=params.storeCity
        this.state=params.storeState
        this.address1=params.storeAdd1
        this.address2=params.storeAdd2
    }
    Store populateDataFromStoreCo(){
        Store store=new Store()
        store?.name=this.name
        store?.owner=this.owner
        store?.address1=this.address1
        store?.address2=this?.address2
        store?.city=this.city
        store?.state=this.state
        return store
    }
}
