# test for the random generator

require_relative '../rock_paper_scissors'

  describe '#rock paper scissors' do
    specify { expect { rock_paper_scissors }.to output(/Rock/).to_stdout }
    specify { expect { rock_paper_scissors }.to output(/Paper/).to_stdout }
    specify { expect { rock_paper_scissors }.to output(/Scissors/).to_stdout }
  end


  describe '#rock_paper_scissors result' do
    before do
      $stdin = StringIO.new("1\n")
    end

    after do
      $stdin = STDIN
    end

    it "" do
      expect(capture_name).to be == 'James T. Kirk'
    end
  end
