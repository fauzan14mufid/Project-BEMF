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
        $data['User'] = $this->User->getAllUserx();
        $this->load->view('login',$data);
    }

    public function index()
    {

    }

    public function formlogin()
    {
        if($this->input->post('username') && $this->input->post('password')){
            $username = $this->input->post('username');
            $password = $this->input->post('password');
            $cmatch = $this->User->matchUser($username,$password);
            if($cmatch==0){
                $this->session->set_flashdata(array('error'=>'Username/Password not matching!!'));
                redirect('home/index');
            }
            else{
                redirect('isiabsen/isi');
            }
        }
        else{
            $this->session->set_flashdata(array('error'=>'Input correctly please!!'));
            redirect('home/index');
        }
    }
}

?>