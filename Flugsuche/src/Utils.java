import java.io.PrintWriter;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.sql.DataSource;

import flugsuche.annotation.column;
import flugsuche.annotation.table;
import flugsuche.bean.Flughafen;

public class Utils {
	
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


