<?php

class Poorten{
	private $poorten=array();
	
	function addOutlet($outlet){
		$this->poorten[] = new Outlet($outlet);
	}

	function get(){
		return jsonencode($this->poorten);
	}
	
	
}