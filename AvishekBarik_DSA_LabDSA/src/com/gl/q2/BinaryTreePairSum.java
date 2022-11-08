package com.gl.q2;

import java.util.HashSet;

public class BinaryTreePairSum{
	
	static class TreeNode{
		int data;
		TreeNode left,right;
		
		TreeNode(int data){
			this.data=data;
			this.left=this.right=null;
		}
	}
	
	private static TreeNode insertTreeNode(TreeNode root,int data) {
		//base
		if(root==null) {
			return new TreeNode(data);
		}
		
		if(root.data>data) {
			root.left=insertTreeNode(root.left, data);
		}
		else
			root.right=insertTreeNode(root.right, data);
		
		return root;
	}
	
	
	public static void main(String[] Arghs) {
		
		TreeNode root=null;
		
		root=insertTreeNode(root,40);
		root=insertTreeNode(root,20);
		root=insertTreeNode(root,60);
		root=insertTreeNode(root,10);
		root=insertTreeNode(root,30);
		root=insertTreeNode(root,50);
		root=insertTreeNode(root,80);
		//Tree Constructed
		
		int sum=80;
		
		boolean result=findSumPair(root,sum);
		
		if(!result)
			System.out.println("Nodes are not found");
		
		
	}


	private static boolean findSumPair(TreeNode root, int sum) {
		HashSet<Integer> data=new HashSet<Integer>();
		return isPairExists(root,data,sum);
	}


	private static boolean isPairExists(TreeNode root, HashSet<Integer> data, int sum) {
		if(root==null)
			return false;
		
		int comp=sum-root.data;
		
		
		if(data.contains(comp)) {
			System.out.println("Node pair found \n"+"Sum="+sum);
			System.out.println("Pair is ("+root.data+","+comp+")");
			return true;
		}
		else {
			data.add(root.data);
		}
		
		return isPairExists(root.left, data,sum)||isPairExists(root.right, data,sum);
	}



	
	
	
	
	
}