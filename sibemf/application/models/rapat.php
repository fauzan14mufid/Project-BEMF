<?php
/**
 * Created by PhpStorm.
 * User: andre.na70
 * Date: 3/2/2015
 * Time: 6:10 PM
 */

class Rapat extends CI_Model {
    public function getAllRapat()
    {
        $query = $this->db->get('rapat');
        return $query;
    }

    public function getIDRapat()
    {
        $this->db->order_by("id_rapat","desc");
        $q = $this->db->get('rapat');
        $query = $q->first_row(); 
        return $query;
    }

    public function getRapatDepartemen($id_dp)
    {
        $query = $this->db->get_where('rapat',array('ID_Departemen'=>$id_dp));
        return $query;
    }

    public function setDataRapat($data)
    {
        $this->db->insert('rapat',$data);
    }

    public function getTotalRapatDepartemen($id_dp)
    {
        $this->db->where('ID_Departemen',$id_dp);
        $this->db->from('departemen');
        $res = $this->db->count_all_results();
        return $res;
    }

    public function getTotalRapat()
    {
        $query = $this->db->count_all('rapat');
        return $query;
    }
}

?>