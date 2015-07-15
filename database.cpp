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

    isSp = true;
	isStop = false;
    thePayment = 0;
    spentTime = 0;
    spPerSec = 0.6;
    mpPerSec = 0.8;

	connect(timer, SIGNAL(timeout()), this, SLOT(calculate()));
}

int DataBase::payment()
{
	return thePayment;
}

void DataBase::setPayment(int payment)
{
	thePayment = payment;
	emit paymentChanged();
}

int DataBase::duration()
{
	return spentTime;
}

void DataBase::setDuration(int duration)
{
	spentTime = duration;
	emit durationChanged();
}

void DataBase::start()
{
	if (isStop) {

		spentTime = 0;
		isStop = false;
	}

	timer->start(1000);

}

void DataBase::pause()
{
	timer->stop();
}

void DataBase::stop()
{
	timer->stop();
	isStop = true;

}

void DataBase::spActivated()
{
	isSp = true;
}

void DataBase::mpActivated()
{
	isSp = false;
}

void DataBase::calculate()
{
	setDuration(spentTime + 1);
}
