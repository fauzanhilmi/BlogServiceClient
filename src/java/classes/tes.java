/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author USER
 */
public class tes {
    public static void main(String args[]) {
        tes t = new tes();
        System.out.println(addUser("john doe","fauzan","hilmi","f@h.com","Admin"));
        
    }

    private static boolean addUser(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4) {
        org.chamerling.heroku.service.HelloServiceImplService service = new org.chamerling.heroku.service.HelloServiceImplService();
        org.chamerling.heroku.service.HelloService port = service.getHelloServiceImplPort();
        return port.addUser(arg0, arg1, arg2, arg3, arg4);
    }
            
}
