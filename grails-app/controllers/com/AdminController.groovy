package com

import com.admin.mixpanel.EventDetailDTO
import com.admin.mixpanel.MixPanel
import com.bookstore.User
import grails.plugin.springsecurity.annotation.Secured
import groovy.json.JsonSlurper
import org.codehaus.groovy.grails.web.json.JSONObject

@Secured(['ROLE_ADMIN'])
class AdminController {
    def springSecurityService
    def adminService

    def index() {
        User user = springSecurityService.currentUser
        render(view: 'index', model: [user: user])
//        render "Admin"
    }

    def dashboard() {
        String webPage = MixPanel.basicRestCall("https://mixpanel.com/api/2.0/engage")
        JSONObject obj = new JSONObject(webPage)
        println "=========================================================" + obj.getString("results")
        String eventType = "click nav a link"
        def userList = new JsonSlurper().parseText(obj.getString("results"))
        userList.each { println "USER=======================" +it }
        User user = springSecurityService.currentUser
        webPage = MixPanel.basicRestCall('https://data.mixpanel.com/api/2.0/export/?from_date=2016-08-25&to_date=2016-9-23')

        String[] webPageArray = webPage.split("}}")
        List<String> eventStringList = []
        String str = null
        webPageArray.each {
            it = it.replaceAll("\n", "")
            if (it != null && it.size() > 0) {
                str = it + "}}"
                eventStringList.add(str)
            }
        }
        JSONObject eventObj = new JSONObject(webPage);
        List eventList = []
        eventStringList.each {
            EventDetailDTO eventDetailDTO = new EventDetailDTO()
            eventObj = new JSONObject(it)
            eventDetailDTO.eventType = eventObj.event
            eventDetailDTO.eventId = eventObj.properties.id
            eventDetailDTO.firstName = eventObj.properties.first_name
            eventDetailDTO.lastName = eventObj.properties.last_name
            eventDetailDTO.userId = eventObj.properties.userId
            eventDetailDTO.userEmailId = eventObj.properties.email
            eventList.add(eventDetailDTO)
        }
        render(view: '/admin/index', model: [totalUser: obj.getString("total"), userList: userList, user: user, eventList: eventList, eventType: "All Event", eventSize: eventList.size()])
    }


}
