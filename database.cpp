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

	connect(timer, SIGNAL(timeout()), this, SLOT(calculate()));
}

int DataBase::payment()
{
	return thePayment;
}

void DataBase::calculate()
{

}

void DataBase::setPayment(int payment)
{
	thePayment = payment;
	emit paymentChanged();
}

QString DataBase::duration()
{
	return time->toString("hh:mm:ss");
}

void DataBase::setDuration(QString duration)
{
	time->setHMS(0,0,0,0);
	emit durationChanged();
}

void DataBase::start()
{
	timer->start(1000);
}

void DataBase::pause()
{
	timer->stop();
}

void DataBase::stop()
{
	timer->stop();
}

void DataBase::spActivated()
{
	isSp = true;
}

void DataBase::mpActivated()
{
	isSp = false;
}
