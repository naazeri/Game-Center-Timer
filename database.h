#pragma once

#include <QObject>
#include <QTimer>

class DataBase : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int payment READ payment WRITE setPayment NOTIFY paymentChanged)
	Q_PROPERTY(int duration READ duration WRITE setDuration NOTIFY durationChanged)

public:
    explicit DataBase(QObject *parent = 0);
    ~DataBase();

	void initData();
	int payment();
	int duration();
	void setPayment(int payment);
	void setDuration(int duration);

private:
	bool isSp, isStop;
    int thePayment;
	int spentTime;
    float spPerSec, mpPerSec;
	QTimer *timer;

signals:
    void paymentChanged();
	void durationChanged();

public slots:
    void start();
    void pause();
    void stop();
    void spActivated();
    void mpActivated();
	void calculate();

};
