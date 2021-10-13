@isTest
public class TestVerifyDate
{
	@isTest static void CheckDates1()
	{
       Date date1 = Date.newInstance(2018, 6, 17);
       Date date2 = Date.newInstance(2018, 7, 5);
       Date r=VerifyDate.CheckDates(date1, date2);
       System.assertEquals(date2,r); 
    }
    
    @isTest static void CheckDates2()
	{
       Date date1 = Date.newInstance(2018, 6, 17);
       Date date2 = Date.newInstance(2018, 8, 30);
       Date r=VerifyDate.CheckDates(date1, date2);
       Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
	   Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays); 
       System.assertEquals(lastDay,r); 
    }    
    
}