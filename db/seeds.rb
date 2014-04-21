# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

items = BacklogItem.create([
		{
			title: "P1.Story_1",
			description: "bla bla",
			estimation: "1",
			parent_id: "1",
			status: "product",
			item_type: "story"
		},
		{
			title: "P1.Story_2",
			description: "bla bla",
			estimation: "1",
			parent_id: "1",
			status: "product",
			item_type: "story"
		},
		{
			title: "P1.Story_3",
			description: "bla bla",
			estimation: "1",
			parent_id: "1",
			status: "product",
			item_type: "story"
		},
		{
			title: "P2.Story_1",
			description: "bla bla",
			estimation: "1",
			parent_id: "2",
			status: "product",
			item_type: "story"
		},
		{
			title: "P2.Story_2",
			description: "bla bla",
			estimation: "1",
			parent_id: "2",
			status: "product",
			item_type: "story"
		},
		{
			title: "P2.Story_3",
			description: "bla bla",
			estimation: "1",
			parent_id: "2",
			status: "product",
			item_type: "story"
		}
   ])

projects = Project.create([
    {
        title: 'car', 
        description: 'Magazine',
        start: '10.10.10',
        finish: '11.11.11',
        owner: 'A',
        pm: '1'
    },
    {
        title: 'web', 
        description: 'WebApp',
        start: '10.10.10',
        finish: '12.12.12',
        owner: 'B',
        pm: '2'
    },
    {
        title: 'sport', 
        description: 'Training',
        start: '13.13.13',
        finish: '14.14.14',
        owner: 'C',
        pm: '2'
    },
    {
        title: 'TaskManager', 
        description: 'Task Manager SoftServe',
        start: '10.02.14',
        finish: '10.03.14',
        owner: 'B',
        pm: '1'
    }])

users = User.create([
    {
        first_name: 'Enzo', 
        last_name: 'Ferrary',
        email: 'enzoferrary@i.ua',
        password: '12345678',
        password_confirmation: '12345678'
    },
    {
        first_name: 'Name', 
        last_name: 'Surname',
        email: 'surname@mail.ru',
        password: '11111111',
        password_confirmation: '11111111'
    },
    {
        first_name: 'Arnold', 
        last_name: 'Schwarzenegger',
        email: 'arni@i.ua',
        password: '1111',
        password_confirmation: '1111'
    },
    {
        first_name: 'Vova', 
        last_name: 'Levij',
        email: 'sda@i.ua',
        password: '1111',
        password_confirmation: '1111'
    },
    {
        first_name: 'Zora', 
        last_name: 'Pravij',
        email: 'sdaaa@i.ua',
        password: '1111',
        password_confirmation: '1111'
    }])

teams = Team.create([
    {
        title: 'team1', 
        description: 'some',
        project_id: 1
    },
    {
        title: 'team2', 
        description: 'some',
        project_id: 1
    },
    {
        title: 'team3', 
        description: 'some',
        project_id: 2
    },
    {
        title: 'team4', 
        description: 'some',
        project_id: 3
    },
    {
        title: 'team5', 
        description: 'some',
        project_id: 4
    }])

team_member = TeamMember.create([
    {
        user_id: 1,
        team_id: 1,
        role: 'watcher'
        },
    {
        user_id: 1,
        team_id: 2,
        role: 'watcher'
    },
    {
        user_id: 1,
        team_id: 5,
        role: 'watcher'
    },
    {
        user_id: 1,
        team_id: 3,
        role: 'developer'
    },
    {
        user_id: 2,
        team_id: 3,
        role: 'developer'
    },
    {
        user_id: 3,
        team_id: 3,
        role: 'developer'
    },
    {
        user_id: 3,
        team_id: 5,
        role: 'developer'   
    }])

stories = Story.create([
  {
    :title => "Project1.Sprintstory1",
    :description => "beatiful",
    :status => "Sprint",
    :project_id => "1",
    :sprint_id => "1"
  },
  {
    :title => "Project1.Productstory1",
    :description => "beatiful",
    :status => "Product",
    :project_id => "1",
    :sprint_id => "1"
  },
  {
    :title => "Project2.Productstory1",
    :description => "beatiful",
    :status => "Product",
    :project_id => "2",
    :sprint_id => "3"
  },
  {
    :title => 'Project1.Productstory2',
    :description => "beatiful",
    :status => "Product",
    :project_id => "2",
    :sprint_id => "3"
  }])

tasks = Task.create([
    {
        title: 'First task',
        description: 'task for 1 story',
        story_id: 1,        
        status: 'todo'
    },
    {
        title: 'Second task',
        description: 'task for 1 story',
        story_id: 1,       
        status: 'done'
    },
    {
        title: 'Third task',
        description: 'task for 1 story',
        story_id: 1,        
        status: 'in-progress'
    },
    {
        title: 'Fourth task',
        description: 'task for 2 story',
        story_id: 2,        
        status: 'done'
    },
    {
        title: 'Fifth task',
        description: 'task for 3 story',
        story_id: 3,       
        status: 'in-progress'
    },
    {
        title: 'Sixth task',
        description: 'task for 4 story',
        story_id: 4,        
        status: 'done'
    },
    {
        title: 'Seventh task',
        description: 'task for 4 story',
        story_id: 4,        
        status: 'done'
    }])

sprints = Sprint.create([    
    {
        title: 'First sprint',
        description: 'sprint1 for project1',
        project_id: 1,        
        status: 'active',
        start: '10.10.2013',
        finish: '24.10.2013'
    },
    {
        title: 'Second sprint',
        description: 'sprint2 for project1',
        project_id: 1,        
        status: 'unactive',
        start: '24.10.2013',
        finish: '12.11.2013'
    },
    {
        title: 'First sprint',
        description: 'sprint1 for project2',
        project_id: 2,        
        status: 'active',
        start: '3.03.2014',
        finish: '15.03.2014'
    }])


