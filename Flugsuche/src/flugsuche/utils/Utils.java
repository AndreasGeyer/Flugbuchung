package flugsuche.utils;

import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Utils {

/*
 * TODO: statische Methode zum Cookie erneuern
 */
	public static void reloadCookies(){
		
	}
	
	public static Date getNearestDate(Map<Date,Double> map, Date flugDatum){
		Set<Date> keys =  map.keySet();
		if(keys.size() == 0){
			return null;
		}
		else{
			Iterator<Date> iterator = keys.iterator();
			Date nearestKey = iterator.next();
			Long abstand = Math.abs(flugDatum.getTime()-nearestKey.getTime());
			while(iterator.hasNext()){
				Date nextkey = iterator.next();
				if(Math.abs(flugDatum.getTime()-nextkey.getTime())<abstand){
					abstand = Math.abs(flugDatum.getTime()-nextkey.getTime());
					nearestKey = nextkey;
				}
			}
			return nearestKey;
		}
	}
}
