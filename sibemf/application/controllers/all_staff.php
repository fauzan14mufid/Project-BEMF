<?php
/**
 * Created by PhpStorm.
 * User: andre.na70
 * Date: 3/2/2015
 * Time: 10:36 PM
 */

class All_Staff extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Staff');
        $this->load->model('Rapat');
        $this->load->model('Kehadiran');
        $this->load->model('Departemen');
    }

    public function daftar()
    {
        $data['Staff'] = $this->Staff->getAllStaff()->result();
        $this->load->view('__view__',$data);
    }

    public function staff($id)
    {
        $data['Staff'] = $this->Staff->getDataStaff($id)->row();
        $data['Kehadiran'] = $this->Kehadiran->getKehadiranRapat($id)->result();
        $this->load->view('staff_report',$data);
    }
}

?>