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
        $this->load->model('Departemen');
        $this->load->model('User');
    }

    public function login()
    {
        $this->load->view('login');
    }

    public function logout()
    {
        session_unset(); 
        session_destroy();
        redirect('home/login');
        $this->clear_cache();
        session_destroy();
    }


    public function formlogin()
    {
        if($this->input->post('username') && $this->input->post('password')){
            $username = $this->input->post('username');
            $password = $this->input->post('password');
            $cmatch = $this->User->matchUser($username,$password);
            if($cmatch==0){
                redirect('home/login');
                session_destroy();
            }
            else{
                $q=$this->User->getUserxDetail($username)->row();
                session_start();
                $id = $q->ID_Departemen;
                $nama_departemen = $q->Nama;
                $_SESSION['departemen'] = $id;
                $_SESSION['departement'] = $nama_departemen;
                redirect('isi_absen/home');
            }
        }
        else{
            redirect('home/login');
            session_destroy();
        }
    }

}

?>