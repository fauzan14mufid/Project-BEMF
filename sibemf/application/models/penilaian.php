<?php

class Penilaian extends CI_Model {
    public function setNilai()
    {

    	 $this->db->insert('penilaian',$data);
    }
}

?>