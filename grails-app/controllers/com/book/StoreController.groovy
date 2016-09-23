package com.book

import com.Store
import com.admin.StoreCO
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class StoreController {

    def adminService
    def allStore(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        List<Store> storeList = Store.createCriteria().list(max: params.max, offset: params.offset) {

        }
        render(view: "allStore", model: [storeList: storeList, storeTotal: storeList.totalCount, max: params.max])
    }

    def addStore() {
        StoreCO storeCO = new StoreCO()
        render(view: "addStore", model: [storeCO: storeCO])
    }

    def saveStore() {
        StoreCO storeCO = new StoreCO()
        storeCO.populateDataFromParams(params)
        if (!storeCO.validate()) {
            render(view: "addStore", model: [storeCO: storeCO])
            return
        }
        Store store = storeCO.populateDataFromStoreCo()
        store.save(flush: true)
        redirect(action: 'allStore')
    }

    def updateStore() {

    }

    def deleteStore() {
        println("/////")
        def data=[:]
        def id = params.id as Long
        println("My data is "+id)
        def store = Store.findById(id)
        Boolean flag=adminService.deleteStore(store)
        if(flag){
            data.success="success"
        }
        else {
            println("Failed")
            data.failed="failed"
        }
        render data as JSON
    }

    def showStore(Long id) {
        println("Find")
        Store store = Store.findById(id)
        println(store)
        render(view: 'showStore', model: [store: store])
    }
}
