/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author Raxex
 */
public class SelectorController {
    public String selectorPag(String pag){
        
        String fpag="";
        if(pag != null){
            if(pag.equals("envios_c")){
                fpag="/admin/envios/C.jsp";
            }
        }else{
            fpag="default.jsp";
        }
        return fpag;
    }
}
