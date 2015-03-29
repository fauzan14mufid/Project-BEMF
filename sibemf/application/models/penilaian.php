<?php

class Penilaian extends CI_Model {
    public function setNilai($data)
    {

    	 $this->db->insert('penilaian',$data);
    }

    public function StaffOTMonth($bulan,$i)
    {
    
		$this->db->order_by('penilaian.Total_Nilai','desc');
       	$this->db->where('penilaian.ID_Departemen',$i);
       	$this->db->where('penilaian.Bulan',$bulan);
       	$this->db->from('penilaian');
       	$this->db->join('staff','staff.ID_Staff=penilaian.ID_Staff');
       	$query = $this->db->get();
        return $query->first_row();
    
    	 
    }
}

?>