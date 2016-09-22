<?php
namespace App\Controller\Test;
use Common\Controller\AppController;

class UploadLocationController extends AppController
{

    protected $LOCA = 'loca';

    protected $GRAVITY_DATA = 'gravity_data';

    protected $DEVICE = 'device';

    public function index ()
    {}

    public function registDevice ()
    {
        $device_token = I('device_token');
        if ($device_token) {
            $result = get_info($this->DEVICE, 
                    array('device_token' => $device_token));
            if (! $result) {
                $result = update_data($this->DEVICE);
            }
            $this->ajaxReturn(_OK('操作成功'));
        } else {
            $this->ajaxReturn(_FAIL('设备号不能为空'));
        }
    }

    public function saveGravity ()
    {
//         if(I('gravitys')){
//         }
        // echo ''.is_numeric(1.1);die;
        $rules = array(array('device_token','require','无效的设备号！',1),
                array('x','is_numeric','参数错误',1,'function'),
                array('y','is_numeric','参数错误',1,'function'),
                array('z','is_numeric','参数错误',1,'function'));
        $_POST['data_time']=getMillisecond();
       // echo $_POST['add_time'];die;
        $result = update_data($this->GRAVITY_DATA, $rules);
        if (is_numeric($result)) {
            $this->ajaxReturn(_OK('保存成功'));
        } else {
            $this->ajaxReturn(_FAIL($result));
        }
    }

    public function saveLocation ()
    {
        $rules = array(array('device_token','require','无效的设备号！',1),
                array('lat','require','参数错误',1),array('lng','require','参数错误',1));
        // 默认情况下用正则进行
        $result = update_data($this->LOCA, $rules);
        if (is_numeric($result)) {
            $this->ajaxReturn(_OK('保存成功'));
        } else {
            $this->ajaxReturn(_FAIL($result));
        }
    }
}
    