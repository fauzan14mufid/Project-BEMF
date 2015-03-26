<?php
/**
 * Created by PhpStorm.
 * User: andre.na70
 * Date: 3/2/2015
 * Time: 6:11 PM
 */

class User extends CI_Model {
    public function getAllUserx()
    {
        $query = $this->db->get('userx');
        return $query;
    }

    public function getUserxDetail($username)
    {
        $query = $this->db->get_where('userx',array('Nama' => $username));
        return $query;
    }

    public function matchUser($user, $pass)
    {
        $data = array(
            'Nama' => $user,
            'Password' => $pass
        );
        $this->db->where($data);
        $this->db->from('userx');
        $count = $this->db->count_all_results();
        return $count;
    }
}

?>