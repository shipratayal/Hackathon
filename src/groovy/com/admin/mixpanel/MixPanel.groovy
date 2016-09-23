package com.admin.mixpanel

import org.apache.commons.codec.binary.Base64

import java.text.SimpleDateFormat


class MixPanel {

    public static String basicRestCall(String webPage) {
        String result;
        try {
            String name = "a8b39f0197cb69044c9353bdcb3d781e";
            String password = "";

            String authString = name + ":" + password;
            System.out.println("auth string: " + authString);
            byte[] authEncBytes = Base64.encodeBase64(authString.getBytes());
            String authStringEnc = new String(authEncBytes);
            System.out.println("Base64 encoded auth string: " + authStringEnc);

            URL url = new URL(webPage);
            URLConnection urlConnection = url.openConnection();
            urlConnection.setRequestProperty("Authorization", "Basic " + authStringEnc);
            urlConnection.setRequestProperty("api_secret", "a8b39f0197cb69044c9353bdcb3d781e");
            InputStream is = urlConnection.getInputStream();
            InputStreamReader isr = new InputStreamReader(is);

            int numCharsRead;
            char[] charArray = new char[1024];
            StringBuffer sb = new StringBuffer();

            while ((numCharsRead = isr.read(charArray)) > 0) {
                sb.append(charArray, 0, numCharsRead);

            }
            result = sb.toString();

            System.out.println("*** BEGIN ***");
            System.out.println(result);
            System.out.println("*** END ***");

        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return result
    }


    public static String changeDateFormat(String oldDateString) {
        final String OLD_FORMAT = "MM/dd/yyyy";
        final String NEW_FORMAT = "yyyy-MM-dd";
        String newDateString;

        SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
        Date d = sdf.parse(oldDateString);
        sdf.applyPattern(NEW_FORMAT);
        return sdf.format(d);
    }
}
