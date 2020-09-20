package com.athletepromote.Utils;

public enum States {
	Other(" "),
	AL("Alabama"),
    MT("Montana"),
    AK("Alaska"),
    NE("Nebraska"),
    AZ("Arizona"),
    NV("Nevada"),
    AR("Arkansas"),
    NH("New Hampshire"),
    CA("California"),
    NJ("New Jersey"),
    CO("Colorado"),
    NM("New Mexico"),
    CT("Connecticut"),
    NY("New York"),
    DE("Delaware"),
    NC("North Carolina"),
    FL("Florida"),
    ND("North Dakota"),
    GA("Georgia"),
    OH("Ohio"),
    HI("Hawaii"),
    OK("Oklahoma"),
    ID("Idaho"),
    OR("Oregon"),
    IL("Illinois"),
    PA("Pennsylvania"),
    IN("Indiana"),
    RI("Rhode Island"),
    IA("Iowa"),
    SC("South Carolina"),
    KS("Kansas"),
    SD("South Dakota"),
    KY("Kentucky"),
    TN("Tennessee"),
    LA("Louisiana"),
    TX("Texas"),
    ME("Maine"),
    UT("Utah"),
    MD("Maryland"),
    VT("Vermont"),
    MA("Massachusetts"),
    VA("Virginia"),
    MI("Michigan"),
    WA("Washington"),
    MN("Minnesota"),
    WV("West Virginia"),
    MS("Mississippi"),
    WI("Wisconsin"),
    MO("Missouri"),
    WY("Wyoming");
   
	
	

     private String id;

     private States(String id){
         this.id = id;
     }

     public String getId()
     {
         return id;
     }
     

}
