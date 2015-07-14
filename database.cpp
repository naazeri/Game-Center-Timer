#include "database.h"

DataBase::DataBase(QObject *parent) : QObject(parent)
{
	initData();
}

DataBase::~DataBase()
{

}

void DataBase::initData()
{
	timer = new QTimer(this);
	time = new QTime();
	time->setHMS(0,0,0,0);

	isSp = true;
	thePayment = 0;
	spentTime = 0;
	spPerSec = 0.6;
	mpPerSec = 0.8;

	connect(timer, SIGNAL(timeout()), this, SLOT());
}

int DataBase::payment()
{
	return thePayment;
}

void DataBase::setPayment(int payment)
{
	thePayment = payment;
}

void DataBase::start()
{

}

void DataBase::pause()
{

}

void DataBase::stop()
{

}

void DataBase::spActivated()
{

}

void DataBase::mpActivated()
{

}
