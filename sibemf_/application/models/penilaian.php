<?php

class Penilaian extends CI_Model {
    public function setNilai($data)
    {

    	 $this->db->insert('penilaian',$data);
    }
}

?>