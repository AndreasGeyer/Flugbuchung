package flugsuche.bean;

import java.util.Comparator;

public  class ComparatorFlug {
	

	
	public static Comparator<Flug> getComparatorPreis(){
		Comparator<Flug> comp = new ComparatorPreis();	
		return comp;
	}
	
	public static Comparator<Flug> getComparatorFlugdauer(){
		Comparator<Flug> comp = new ComparatorFlugDauer();	
		return comp;
	}
	
	
	private static class ComparatorPreis implements Comparator<Flug>{


		@Override
		public int compare(Flug o1, Flug o2) {
			return Double.compare(o1.getPreis(), o2.getPreis());
		}
		
	}
	
	private static class ComparatorFlugDauer implements Comparator<Flug>{

		@Override
		public int compare(Flug o1, Flug o2) {
			return o1.getFlugdauer().compareTo(o2.getFlugdauer());
		}
		
	}

}
