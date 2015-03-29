<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class login_controller extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->library('session');
        $this->load->helper('form');
        $this->load->helper('url');
        $this->load->model('User')
	}

	public function index()
	{
		$this->load->view('login.php');  
		if(($username = $this->input->post('username',TRUE)) && ($pass = $this->input->post('pass',TRUE)) ){
			$count=$this->User->matchUser($username,$pass);
			if(!empty($count)){
				$id_departemen = this->User->getUserxDetail($username)->ID_Departemen;
				session_start();
				
			}
		}
	}

}
