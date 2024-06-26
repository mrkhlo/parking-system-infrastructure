echo -e 'Creating kafka topics'
kafka-topics --zookeeper $1:2181 --create --if-not-exists --topic payment-refund --replication-factor 3 --partitions 3
kafka-topics --zookeeper $1:2181 --create --if-not-exists --topic payment-debit --replication-factor 3 --partitions 3
kafka-topics --zookeeper $1:2181 --create --if-not-exists --topic parking-created --replication-factor 3 --partitions 3
kafka-topics --zookeeper $1:2181 --create --if-not-exists --topic parking-stopped --replication-factor 3 --partitions 3
kafka-topics --zookeeper $1:2181 --create --if-not-exists --topic parking-approved --replication-factor 3 --partitions 3

echo -e 'Successfully created the following topics:'
kafka-topics --zookeeper $1:2181 --list

# local-confluent-kafka-cp-zookeeper-headless

