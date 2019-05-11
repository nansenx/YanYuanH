/**
 * 配置Tomcat启动动画
 */
package com.Beam.common;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyTomcatListener implements ServletContextListener {
    //启动时
    @Override
    public void contextInitialized(ServletContextEvent sce) {

//        System.err.println(         "       ____ "              );
//        System.err.println(         "   .-'&     '-."            );
//        System.err.println(         "  /            \\"          );
//        System.err.println(         " :    o    o     ;"          );
//        System.err.println(         "(       (_       )"         );
//        System.err.println(         " :              ;"          );
//        System.err.println(         "  \\    __      /"          );
//        System.err.println(         "   `-.______.-'"            );
//        System.err.println(         "     /`\"\"\"`\\"          );
//        System.err.println(         "    /    ,  \\"            );
//        System.err.println(         "   /|/\\/\\/\\ _\\ "       );
//        System.err.println(         "  (_|/\\/\\/\\\\__)"       );
//        System.err.println(         "    |_______|"             );
//        System.err.println(         "   __)_ |_ (__"            );
//        System.err.println(         "  (_____|_____)"           );
        System.err.println("  ....................Tomcat启动中...................");
        System.err.println("....................WELCOME,MR.Liang...................");
        System.err.println("....................WELCOME,MR.Liang...................");
    }

//    启动后
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println();
        System.err.println("  ....................Tocat启动成功...................");
        System.err.println("....................WELCOME,MR.Liang...................");
        System.err.println("....................WELCOME,MR.Liang...................");


    }

}
