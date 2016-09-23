package com.admin

import java.text.DateFormat
import java.text.SimpleDateFormat

class AppUtil {
    static Date getDateFromIndividualDateParameter(String day, String month, String year) {
        Date returnDate = null
        println("/////${day}//////${month}///////////${year}////////")
        String dateString = "${day}/${month}/${year}"
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy")
        try {
            returnDate = dateFormat.parse(dateString)

        } catch (Exception e) {
            println("*****error parsing date exception*******")
        }
        return returnDate
    }
}
