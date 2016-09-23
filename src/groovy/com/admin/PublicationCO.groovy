package com.admin

import com.Publication
import grails.validation.Validateable

@Validateable
class PublicationCO {
    String name
    Date startDate

    static constraints = {
        name(nullable: false,blank: false)
        startDate(nullable: false)
    }

    def populateDataFromParams(def params){
        this.name=params.name
        this.startDate=AppUtil.getDateFromIndividualDateParameter(params.startDate_day, params.startDate_month, params.startDate_year)
        println(this.name)
        println(this.startDate)
    }
    Publication populateDataFromPublicationCO(){
        Publication publication=new Publication()
        publication.name=this?.name
        publication.startDate=this?.startDate
        return publication
    }
}
