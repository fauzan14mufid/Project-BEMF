<?php

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

    public function index()
    {
        $this->load->view('login');
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
                //print_r ($id);
                redirect('isi_absen/home');
            }
        }
        else{
            redirect('home/index');
        }
    }
}

?>