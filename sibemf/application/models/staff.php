<?php
/**
 * Created by PhpStorm.
 * User: andre.na70
 * Date: 3/2/2015
 * Time: 6:11 PM
 */

class Staff extends CI_Model {
    public function getAllStaff()
    {
        $query = $this->db->get('staff');
        return $query;
    }

    public function getDataStaff($nrp)
    {
        $query = $this->db->get_where('staff',array('ID_Staff'=>$nrp));
        return $query;
    }

    public function getStaffByDeptID($id_dp)
    {
        $query = $this->db->get_where('staff',array('ID_Departemen'=>$id_dp));
        return $query;
    }
}

?>