#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>

class DataBase : public QObject
{
	Q_OBJECT
public:
	explicit DataBase(QObject *parent = 0);
	~DataBase();

signals:

public slots:
};

#endif // DATABASE_H
