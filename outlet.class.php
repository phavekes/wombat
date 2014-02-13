<?php

class Outlet
{
  //gegevens over een outlet
  protected $id;
  protected $outlet;
  protected $switch;
  protected $module;
  protected $port;
  protected $vlan;
  protected $voicevlan;
  protected $speed;
  protected $duplex;
  protected $soort;
  protected $opmerkingen;
  protected $ruimte;
  protected $locatie;
  protected $shutdown;
  protected $portsecurity;
  protected $PortSecViolations;
  protected $portstate;
  protected $negeerhubzoeker;
  protected $inoct;
  protected $outoct;
  protected $JumboFrames;
  
  //interne variabelen
  protected $shouldSave = 0;
  protected $db;
  
	//constructor met outletnaam
	function __construct($name) { 
		//lees de huidige config uit de database en vul de gegevens
		$this->getOutletByName($name);
	}
	
	//Haal de gegevens op van een (1) outlet
	//Geeft true or false terug, afhankelijk van het succes
	public function getOutletByName($name=null){
		if (empty($db)) $this->openDb();
		$resultArray=$this->db->get_array("select * from outlets where outlet='".$name."'");
		if ($this->db->num_rows()==1) {
		    $this->id=$resultArray['id'];
		    $this->outlet=$resultArray['outlet'];
		    $this->switch=$resultArray['switch'];
		    $this->module=$resultArray['module'];
		    $this->port=$resultArray['port'];
		    $this->vlan=$resultArray['vlan'];
		    $this->voicevlan=$resultArray['voicevlan'];
		    $this->speed=$resultArray['speed'];
		    $this->duplex=$resultArray['duplex'];
		    $this->soort=$resultArray['soort'];
		    $this->opmerkingen=$resultArray['opmerkingen'];
		    $this->ruimte=$resultArray['ruimte'];
		    $this->locatie=$resultArray['locatie'];
		    $this->shutdown=$resultArray['shutdown'];
		    $this->portsecurity=$resultArray['portsecurity'];
		    $this->PortSecViolations=$resultArray['PortSecViolations'];
		    $this->portstate=$resultArray['portstate'];
		    $this->negeerhubzoeker=$resultArray['negeerhubzoeker'];
		    $this->inoct=$resultArray['inoct'];
		    $this->outoct=$resultArray['outoct'];
		    $this->JumboFrames=$resultArray['JumboFrames'];
		    
		    //de data is net uit de database gelezen, dus we hoeven niet op te slaan
		    $this->shouldSave=0;
		    return true;
		}
		
		//outlet niet gevonden
		if ($this->db->num_rows()==0) return false;
		
		//teveel outlets gevonden
		if ($this->db->num_rows()>1) throw new Exception('Too many results. Only 1 expected');
	}
	
	private function openDb()
	{
	    include('./config.php');
	    $this->db = new database( $dbuser, $dbpass, $dbname, $dbhost );
	}
	
	//update het vlan nummer
	public function setvlan($newvlan) {
		$this->vlan = $newvlan;
		$this->schouldSave=1;
	}

	//schrijf naar de database en de switch
	public function save(){
		$this->writeDb;
		$this->writeSwitch;
	}
	
	//schrijf naar de switch
	protected function writeSwitch(){
		$switch=new Switch6500();
		$switch->writeConfig($this);	
	}
	
	//schrijf naar de database
	protected function writeDb() {
	  $query="UPDATE outlets set 
	    vlan=".$this->vlan.",
	    voicevlan=".$this->voicevlan.",
	    speed=".$this->speed."	    
	    WHERE id=".$this->id;
	  $this->db->run_query($query);	  
	  
	}
	
	



}