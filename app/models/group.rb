class Group < ApplicationRecord
    validates :name, presence: true
    
    has_many :concerts, dependent: :destroy
    has_many :crews, dependent: :destroy
    accepts_nested_attributes_for :crews

    enum gender:[:male, :female, :band]

    def qconcerts
        concerts.count
    end

    def to_s
        name
    end

    def qcrews
        self.crews.count
    end

    def qparticipants
        concerts.pluck(:participants).sum
    end

    def qdebut
        if concerts.count > 0
            concerts.order(date: :asc).first.date
        else
            "No debut yet"
        end
    end

    def qmonth
        if concerts.count > 0
            # g = self.concerts.where('extract(year from date) = ?', Time.now.year)
            # g.where('extract(month from date) = ?', Time.now.month).count
            concerts.where('extract(year from date) = ?', Time.now.year).where('extract(month from date) = ?', Time.now.month).count 
        else
            return 0
        end
    end

    def last_concert
        if concerts.count > 0
            concerts.order(date: :asc).last.date
        else
            "No debut yet"
        end
    end

    def qmaxparticipants
        concerts.pluck(:participants).max
    end

    def qmaxduration
        concerts.pluck(:duration).max
    end

end
