public class StringListTest {
    public static List<String> generateStringList(Integer numbers){
        
        List<String> myList = new List<String>();
        
        for (Integer i = 0; i < numbers; i++){
            myList.add('Test ' + i);
        }
        System.debug('myList: ' + myList);
        return myList;
    }
    
}