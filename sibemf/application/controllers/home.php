<?php
/**
 * Created by PhpStorm.
 * User: andre.na70
 * Date: 3/2/2015
 * Time: 8:25 PM
 */

class Home extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->library('session'); // barangkali perlu, hapus kalo bikin error
        $this->load->model('Departemen');
        $this->load->model('User');
    }

    public function login()
    {
        $this->load->view('login');
    }

    public function logout()
    {
        $this->session->sess_destroy();
        $this->load->view('submenu');
    }

    public function index()
    {
        $this->load->view('submenu');
    }

    public function formlogin()
    {
        if($this->input->post('username') && $this->input->post('password')){
            $username = $this->input->post('username');
            $password = $this->input->post('password');
            $cmatch = $this->User->matchUser($username,$password);
            if($cmatch==0){
                redirect('home/index');
            }
            else{
                $q=$this->User->getUserxDetail($username)->row();
                session_start();
                $id = $q->ID_Departemen;
                $_SESSION['departemen'] = $id;
                redirect('isi_absen/isi');
            }
        }
        else{
            redirect('home/index');
        }
    }
}

?>