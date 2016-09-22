# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a1 = Agency.create ({
  business_name: '40k',
  founded_date: '04/01/2016',
  password: '12345',
  password_confirmation: '12345'
})

a2 = Agency.create ({
  business_name: 'Kmation',
  founded_date: '08/06/2012',
  password: 'abcde',
  password_confirmation: 'abcde'
  })

c1 = Client.create ({
  business_name: 'MVNP',
  point_of_contact: 'Kevin Smith',
  password: '12345',
  password_confirmation: '12345',
  agency: a1
  })

c2 = Client.create ({
  business_name: 'WallToWall',
  point_of_contact: 'Jen Doe',
  password: 'abcde',
  password_confirmation: 'abcde',
  agency: a2
  })

C1 = Campaign.create ({
  campaign_name: 'Fall 2016',
  launch_date: '9/25/16'
  })

C2 = Campaign.create ({
  campaign_name: 'Spring 2017',
  launch_date: '3/1/2017'
  })

C3 = Campaign.create ({
  campaign_name: 'Holidays 2016',
  launch_date: '11/01/16'
  })

A1 = Ad.create ({
  html_file: '',
  width: '300',
  height: '250'
  })

A2 = Ad.create ({
  html_file: '',
  width: '300',
  height: '600'
  })
# agency: a1
