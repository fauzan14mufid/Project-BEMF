<?php
/**
 * Created by PhpStorm.
 * User: andre.na70
 * Date: 3/3/2015
 * Time: 10:38 AM
 */

class All_Nilai extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Staff');
        $this->load->model('Penilaian_Staff');
        $this->load->model('Penilaian');
    }

    public function isi()
    {
        $data['Staff'] = $this->Staff->getAllStaff()->result();
        // __view__ : tinggal ubah nama viewnya aja
        $this->load->view('__view__',$data);
    }

    public function sendpenilaian()
    {
        /* Tinggal pake */
    }

    public function all()
    {

    }
}

?>