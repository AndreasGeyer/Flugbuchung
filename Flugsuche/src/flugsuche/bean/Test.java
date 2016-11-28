package flugsuche.bean;

import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedType;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.TypeVariable;
import java.sql.PreparedStatement;

import flugsuche.annotation.column;
import flugsuche.annotation.table;

public class Test {

	public static void main(String[] args) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		System.out.println("SSS");
//
		Flugzeugtyp flugzeugtyp = new Flugzeugtyp();
		flugzeugtyp.setId(20);
		Class classs = flugzeugtyp.getClass();
//		Field[] fields = classs.getDeclaredFields();
//		System.out.println(fields.length);
//	
//		for (Field f : fields) {
//			Annotation[] a = f.getAnnotations();
//			System.out.println(a.length );
//			
//			for (Annotation an : a) {
//				System.out.println();
//				if (an instanceof table) {
//					an = (table) an;
//					System.out.println(((table) an).name()  );
//				} else if (an instanceof column) {
//					an = (column) an;
//					System.out.println(((column) an).name());
//				} else
//					System.out.println(an.getClass().getName());
//
//			}
//		}
//		
//		Class persClass = classs;
//		Annotation[] t =  persClass.getAnnotationsByType(table.class);
//		Field[] coloumnName = persClass.getDeclaredFields();
//		
//		String statement = "INSERT INTO "+ ((table)t[0]).name() +"(";
//		String values = "VALUES(";
//		
//		for(Field field: coloumnName){
//			Annotation[] annotation = field.getAnnotations();
//			System.out.println(persClass.getMethod("getId").invoke(flugzeugtyp));	
//			if(annotation.length > 0 && annotation[0] instanceof column){
//				
//				column column =  (flugsuche.annotation.column) annotation[0];
//				statement = statement + column.name() +",";
//				System.out.println(getName(field));
//				Object value = getName(field)).invoke(flugzeugtyp);
//				if (value != null)
//					values = values + persClass.getMethod("get" + value.;
//			}
//		}
//		System.out.println(statement+ values);
//	}
//	private static String getName(Field field) {
//
//		char firstLetter = field.getName().charAt(0);
//		System.out.println(field.getName());
//		return Character.toString(firstLetter).toUpperCase() + field.getName().substring(1);
	}
}
