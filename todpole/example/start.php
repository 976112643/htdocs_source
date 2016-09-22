<?php
use Workerman\Worker;
require_once './Workerman/Autoloader.php';

// ����һ��Worker����2346�˿ڣ�ʹ��websocketЭ��ͨѶ
$ws_worker = new Worker("tcp://0.0.0.0:2346");

// ����4�����̶����ṩ����
$ws_worker->count = 4;

// ���յ��ͻ��˷��������ݺ󷵻�hello $data���ͻ���
$ws_worker->onWorkerStart=function(){
	echo '����';
};
$ws_worker->onMessage = function($connection, $data)
{
    // ��ͻ��˷���hello $data
    $connection->send('hello ' . $data);
};
// ����
Worker::runAll();