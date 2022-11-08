package com.gl.q1;

import java.util.Stack;


public class BalancingBrackets{
	
	public static void main(String[]  Args) {
		String brackets="{{[()]}}";
		
		if(isBalancedBrackets(brackets))
			System.out.println("The entered String has Balanced Brackets");
		else
			System.out.println("The entered Strings do not contain Balanced Brackets");
	}

	static boolean isBalancedBrackets(String input) {
		Stack<Character> stack = new Stack<Character>(); 
		char ch = 0,stackChar;
		
		for(int i=0;i<input.length();i++) {
			
			ch=input.charAt(i);		//String character

			if(ch=='('||ch=='['||ch=='{') {
				stack.push(ch);
				continue;
			}
				
				
			if(stack.isEmpty()) {
				return false;
			}
				
			
			stackChar=stack.pop();
			if(ch==')'&&stackChar!='(' || ch==']'&&stackChar!='[' || ch=='}'&&stackChar!='{') {
				return false;
			}	
		}
			
		if(stack.isEmpty())
		return true;
		else 
			return false;
	}
	
	
}