/*****************************************************************************/
/***  (c) 2002-2012, DevWizard (DevWizard@free.fr)                         ***/
/***                                                                       ***/
/***                                                                       ***/
/***   Example 11                                                          ***/
/***                                                                       ***/
/*****************************************************************************/

package com.devwizard.javaexe.examples.example11;


import java.awt.*;
import java.io.*;
import java.util.*;

import com.devwizard.javaexe.interfaces.*;


/*****************************************************************************/
public class Example11
	implements JavaExe_I_ApplicationManagement
{
	static Example11_Frame frame = null;
	static String[] dataRestored = null;


	/*******************************************/
	public static boolean sessionIsRestore()
	{
		return true;
	}

	/*******************************************/
	public static String[] sessionGetMainArgs()
	{
		String[] args = (dataRestored==null
			? new String[] { "arg1", "arg2" }
			: null);

		return args;
	}

	/*******************************************/
	public static Serializable sessionGetData()
	{
		return new String[] { getInfoFrame(), getTxtEdit() };
	}

	/*******************************************/
	public static void sessionSetData(Serializable data)
	{
		if(data instanceof String[])
			dataRestored = (String[]) data;
	}

	/*******************************************/
	static String getInfoFrame()
	{
		if(frame==null)
			return "";

		Rectangle rect = frame.getBounds();

		return(""+rect.x
			+","+rect.y
			+","+rect.width
			+","+rect.height);
	}

	/*******************************************/
	static String getTxtEdit()
	{
		return(frame != null ? frame.getTxtEdit() : "");
	}

	/*******************************************/
	static String getStrArgs(String[] args)
	{
		StringBuffer str = new StringBuffer();

		if(args != null)
			for(int i=0;i < args.length;i++)
				str.append("["+i+"] = "+args[i]+"\n");

		return str.toString();
	}

	/*******************************************/
	public static void main(String[] args)
	{
		Example11_Config.init();

		frame = new Example11_Frame(getStrArgs(args)
			,(dataRestored != null && dataRestored.length > 0 ? dataRestored[0] : null)
			,(dataRestored != null && dataRestored.length > 1 ? dataRestored[1] : null));
	}
}
