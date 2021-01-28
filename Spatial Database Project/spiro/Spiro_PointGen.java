import java.io.*;
 import java.util.*;
 import java.text.*;
 import java.math.*;
 import java.util.regex.*;
 
 
 
 class Spiro_PointGen
     {

     public static void main(String[] args) throws Exception
     {                 
      ArrayList<Double>   longitudes = new ArrayList<Double>();
      ArrayList<Double>    latitudes = new ArrayList<Double>();
     	double R =5.0,r=1.0,a=4.0,nRev = 10;
         double x,y,longi,lati,t;
         double bovardLongitude = -118.285554;
         double bovardLatitude = 34.020847;
        longitudes.add(bovardLongitude);
         latitudes.add(bovardLatitude+0.001*(R+r-a));
         
         for(t = 0.00; t<= (Math.PI*nRev) ;t+=0.01)
             {
              x = (R+r)*Math.cos((r/R)*t) - a*Math.cos((1+r/R)*t);
              y = (R+r)*Math.sin((r/R)*t) - a*Math.sin((1+r/R)*t);
              longi = (bovardLongitude + 0.0001*y);
              lati = (bovardLatitude + 0.0001*x);
             longitudes.add(longi);
             latitudes.add(lati);
             
         }
             
        String finalString = "";
         String fileName = "writerFile2.txt";
     FileWriter fileWriter = new FileWriter(fileName);
     BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
        for (int i =0 ; i< longitudes.size();i+=1)
        {
          // finalString = "<Placemark> <Point> <coordinates>"+
            finalString =  String.valueOf(longitudes.get(i))+","+ String.valueOf(latitudes.get(i))+",0\n";
                  // +"</coordinates></Point> </Placemark>\n";   
           bufferedWriter.write (finalString);
           
        }     
    
      bufferedWriter.write (finalString);
      bufferedWriter.close();
     }
 
 }