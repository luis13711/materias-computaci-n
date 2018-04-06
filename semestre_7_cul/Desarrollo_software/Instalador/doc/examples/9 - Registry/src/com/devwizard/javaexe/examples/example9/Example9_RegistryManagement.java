/*****************************************************************************/
/***  (c) 2002-2012, DevWizard (DevWizard@free.fr)                         ***/
/***                                                                       ***/
/***                                                                       ***/
/***   Example 9                                                           ***/
/***                                                                       ***/
/*****************************************************************************/

package com.devwizard.javaexe.examples.example9;


import com.devwizard.javaexe.interfaces.*;


/*****************************************************************************/
public class Example9_RegistryManagement
	implements JavaExe_I_RegistryManagement
{
	/*******************************************/
	public static native String nativeReg_GetValueSTR(int hkey, String pathKey, String nameValue, boolean isExpandVal);
	public static native byte[] nativeReg_GetValueBIN(int hkey, String pathKey, String nameValue);
	public static native int nativeReg_GetValueDWORD(int hkey, String pathKey, String nameValue);
	public static native long nativeReg_GetValueQWORD(int hkey, String pathKey, String nameValue);
	public static native String[] nativeReg_GetValueMULTI(int hkey, String pathKey, String nameValue);

	/*******************************************/
	public static native boolean nativeReg_SetValueSTR(int hkey, String pathKey, String nameValue, String val, boolean isTypeExpand);
	public static native boolean nativeReg_SetValueBIN(int hkey, String pathKey, String nameValue, byte[] val);
	public static native boolean nativeReg_SetValueDWORD(int hkey, String pathKey, String nameValue, int val, boolean isTypeBigEndian);
	public static native boolean nativeReg_SetValueQWORD(int hkey, String pathKey, String nameValue, long val);
	public static native boolean nativeReg_SetValueMULTI(int hkey, String pathKey, String nameValue, String[] val);

	/*******************************************/
	public static native int nativeReg_GetTypeValue(int hkey, String pathKey, String nameValue);

	/*******************************************/
	public static native boolean nativeReg_CreateKey(int hkey, String pathKey);
	public static native boolean nativeReg_DeleteKey(int hkey, String pathKey);
	public static native boolean nativeReg_DeleteValue(int hkey, String pathKey, String nameValue);

	/*******************************************/
	public static native String[] nativeReg_EnumKeys(int hkey, String pathKey);
	public static native String[] nativeReg_EnumValues(int hkey, String pathKey);
}
