package com.jeometria.test;

import com.jeometria.JeometriaSingleton;

public class TestJeometria {

    public static void main(String[] args){

        JeometriaSingleton geom = JeometriaSingleton.getIstance();

        System.out.println(geom.calcolaPerimetroRettangolo(2, 2));
        System.out.println(geom.calcolaAreaRettangolo(2, 2));

        JeometriaSingleton geom2 = JeometriaSingleton.getIstance();

        System.out.println(geom == geom2);
    }
}
