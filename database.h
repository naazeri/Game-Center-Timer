#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QTimer>
#include <QTime>

class DataBase : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int payment READ payment WRITE setPayment NOTIFY paymentChanged)
	Q_PROPERTY(QString duration READ duration WRITE setDuration NOTIFY durationChanged)

public:
    explicit DataBase(QObject *parent = 0);
    ~DataBase();

	void initData();
	int payment();
	QString duration();
	void setPayment(int payment);
	void setDuration(QString duration);

private:
	bool isSp, isStart, isStop, isPause;
    int thePayment;
    qint64 spentTime;
    float spPerSec, mpPerSec;
    QTime *time;
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

#endif // DATABASE_H
